# Discord-Webhook-Tool

A lightweight, interactive Bash script to send messages and file attachments to Discord webhooks.

---

## 🚀 Features

- Simple and intuitive interactive prompts
- Send plain text messages to any Discord webhook
- Upload a single file or image attachment (up to 8MB)
- No dependencies besides `bash` and `curl`
- Quick and portable — works on any Unix-like system with `curl`

---

## 💡 Why Use This?

Discord webhooks are a powerful way to automate messages, alerts, and notifications.  
This tool makes it easy to send messages and files without writing code — just run the script and follow the prompts!

---

## 📋 Usage

1. Clone or download this repository.

2. Make the script executable:

   ```bash
   chmod +x discord-webhook.sh

    Run the script:

    ./discord-webhook.sh

    Follow the prompts:

        Insert your Discord webhook URL

        Enter the message text you want to send

        Choose whether to attach a file, and provide the file path if yes

⚠️ Limitations

    Discord webhook file uploads are limited to 8MB per file.
    The script will reject files larger than this to prevent errors.

    Only one file attachment per message is supported.

    This script does not validate webhook URLs beyond basic input presence.

    The webhook URL should be kept secret — anyone with it can send messages.

📦 Requirements

    bash (typically pre-installed on Linux/macOS)

    curl (command-line HTTP client)

🔒 Security Notes

    Treat your webhook URLs like passwords.

    Do not share or expose them publicly (e.g., public GitHub repos, forums).

    If you suspect your webhook is compromised, regenerate or delete it in Discord.

✨ Example Session

$ ./discord-webhook.sh
Insert Webhook URL: https://discord.com/api/webhooks/1234567890/abcdefghijklmnopqrstuvwxyz

Insert Text Message: Hello from my Bash tool!

Do you want to attach a file? (y/n): y

Enter path to the file/image: ./image.png

📤 Sending message with file...

✅ Sent message with attachment.
