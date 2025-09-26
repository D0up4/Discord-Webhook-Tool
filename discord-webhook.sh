#!/bin/bash

# Ask for Webhook
read -p "Insert Webhook URL: " WEBHOOK_URL
if [[ -z "$WEBHOOK_URL" ]]; then
    echo "❌ Webhook URL is required."
    exit 1
fi

# Ask for Message Text
read -p "Insert Text Message: " MESSAGE
if [[ -z "$MESSAGE" ]]; then
    echo "❌ Message text is required."
    exit 1
fi

# Ask how many times to send the message
read -p "How many times do you want to send the message? (amount): " AMOUNT
if ! [[ "$AMOUNT" =~ ^[0-9]+$ ]]; then
    echo "❌ Invalid amount. Please enter a number."
    exit 1
fi

# Ask if user wants to upload a file
read -p "Do you want to attach a file? (y/n): " ATTACH_FILE

if [[ "$ATTACH_FILE" == "y" || "$ATTACH_FILE" == "Y" ]]; then
    read -p "Enter path to the file/image: " FILE_PATH
    if [[ ! -f "$FILE_PATH" ]]; then
        echo "❌ File does not exist."
        exit 1
    fi

    echo "📤 Sending message with file..."

    for ((i = 1; i <= AMOUNT; i++)); do
        curl -s -X POST "$WEBHOOK_URL" \
            -F "file1=@$FILE_PATH" \
            -F "payload_json={\"content\": \"$MESSAGE\"}"
        echo "✅ ($i/$AMOUNT) Sent message with attachment."
    done

else
    echo "📤 Sending message without file..."

    for ((i = 1; i <= AMOUNT; i++)); do
        curl -s -H "Content-Type: application/json" \
            -X POST \
            -d "{\"content\": \"$MESSAGE\"}" \
            "$WEBHOOK_URL"
        echo "✅ ($i/$AMOUNT) Sent message without attachment."
    done
fi
