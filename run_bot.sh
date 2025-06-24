#!/bin/bash

echo "🌟 SpoofifyPro Bot Setup Script"
echo "================================"

# Check if Python 3 is installed
if ! command -v python3 &> /dev/null; then
    echo "❌ Python 3 is not installed. Please install Python 3.7 or higher."
    exit 1
fi

echo "✅ Python 3 found"

# Check if pip is installed
if ! command -v pip3 &> /dev/null; then
    echo "❌ pip3 is not installed. Please install pip3."
    exit 1
fi

echo "✅ pip3 found"

# Install requirements
echo "📦 Installing required packages..."
pip3 install -r requirements.txt

if [ $? -eq 0 ]; then
    echo "✅ Packages installed successfully"
else
    echo "❌ Failed to install packages"
    exit 1
fi

# Check if bot token is set
if grep -q "YOUR_BOT_TOKEN_HERE" telegram_bot_standalone.py; then
    echo ""
    echo "⚠️  IMPORTANT: You need to set your bot token!"
    echo "1. Go to @BotFather on Telegram"
    echo "2. Create a new bot or use existing one"
    echo "3. Copy the bot token"
    echo "4. Edit telegram_bot_standalone.py and replace 'YOUR_BOT_TOKEN_HERE' with your token"
    echo ""
    read -p "Press Enter after setting your bot token..."
fi

# Run the bot
echo "🚀 Starting SpoofifyPro Bot..."
python3 telegram_bot_standalone.py