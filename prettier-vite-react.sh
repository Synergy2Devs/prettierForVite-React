#!/bin/bash

GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
BOLD='\033[1m'
NC='\033[0m'

VERSION=$(npm view prettier-for-vite-react version 2>/dev/null)

echo -e "${GREEN}=========================================================${NC}"
echo -e "${BLUE}  ${BOLD}prettierForViteReact v${VERSION} ${NC}"
echo -e "${BLUE}  Installation script ViteReact Project${NC}"
echo -e "${RED}${BOLD}  Author: Synergy2Devs${NC}"
echo -e "${YELLOW}${BOLD}  Developers: Marcelo Robin / Jesús García${NC}"
echo -e "${GREEN}=========================================================${NC}"
echo ""

npm install -D prettier eslint-config-prettier

if [ -f .eslintrc.cjs ]; then
    sed -i '/extends:/a\ "plugin:prettier/recommended",\n "eslint-config-prettier",\n' .eslintrc.cjs
    sed -i '/rules:/a\ "no-unused-vars": "warn",\n' .eslintrc.cjs
else
    echo ".eslintrc.cjs not found!!!"
fi

echo "dist" > .eslintignore

cat << EOF > .prettierrc
{
  "singleQuote": true,
  "trailingComma": "all",
  "semi": true,
  "tabWidth": 2,
  "bracketSpacing": true,
  "arrowParens": "always",
  "endOfLine": "lf"
}
EOF

cat << EOF > .prettierignore
dist
package-lock.json
EOF

if [ "$(uname)" = "Darwin" ]; then
  sed -i '' '/"scripts": {/a\    "format": "prettier --write .",' package.json
else
  sed -i '/"scripts": {/a\    "format": "prettier --write .",' package.json
fi

PACKAGE_JSON="./package.json"
if [[ "$OSTYPE" == "darwin"* ]]; then
  sed -i '' 's/\^//g' "$PACKAGE_JSON"
else
  sed -i 's/\^//g' "$PACKAGE_JSON"
fi

echo -e "${GREEN}=========================================================${NC}"
echo -e "${RED}  ${BOLD}Follow us on GitHub:${NC}"
echo -e "${RED}  ${BOLD}https://github.com/Synergy2Devs${NC}"
echo -e "${YELLOW}  ${BOLD}https://github.com/mnibor${NC}"
echo -e "${YELLOW}  ${BOLD}https://github.com/JAJesusGarcia${NC}"
echo -e "${GREEN}=========================================================${NC}"

echo -e "${GREEN}\n${BOLD}READY!!! PROJECT CONFIGURED!!! LET'S CODE!!!${NC}"
echo ""
