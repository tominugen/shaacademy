class MyMailer < ActionMailer::Base

  def sendgrid_client
    @sendgrid_client ||= SendGrid::API.new(api_key: "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")
  end

  def new_user(user)
    template_id = "template_id_of_new_user"

    data = {
      "personalizations": [
        {
          "to": [
            {
              "email": user.email
            }
          ],
          "substitutions": {
            "-name-": "USER_NAME",
            "-content-": user.name
          },
          "subject": "Welcome to SatoshiHayek"
        }
      ],
      "from": {
        "email": "kenzo.tominaga@gmail.com"
      },
      "template_id": template_id
    }

    sendgrid_client.client.mail._("send").post(request_body: data)
  end
end
