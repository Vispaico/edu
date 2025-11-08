#!/bin/bash

echo "🔧 Installing Missing shadcn/ui Components..."
echo "=============================================="
echo ""

# Install all missing components
npx shadcn-ui@latest add button
npx shadcn-ui@latest add card
npx shadcn-ui@latest add input
npx shadcn-ui@latest add label
npx shadcn-ui@latest add textarea
npx shadcn-ui@latest add dialog
npx shadcn-ui@latest add dropdown-menu
npx shadcn-ui@latest add select
npx shadcn-ui@latest add table
npx shadcn-ui@latest add tabs
npx shadcn-ui@latest add toast

echo ""
echo "=============================================="
echo "✅ All shadcn/ui components installed!"
echo ""
echo "Now restart your dev server:"
echo "  npm run dev"
echo "=============================================="
