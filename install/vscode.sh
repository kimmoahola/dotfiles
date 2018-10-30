extensions=(
  CoenraadS.bracket-pair-colorizer
  dbaeumer.vscode-eslint
  eamodio.gitlens
  eg2.tslint
  esbenp.prettier-vscode
  formulahendry.auto-close-tag
  formulahendry.auto-rename-tag
  ms-python.python
  NuclleaR.vscode-extension-auto-import
  oderwat.indent-rainbow
  pflannery.vscode-versionlens
  robertohuertasm.vscode-icons
  samuelcolvin.jinjahtml
  skyapps.fish-vscode
  wayou.vscode-todo-highlight
  wix.vscode-import-cost
)

for ext in "${extensions[@]}"; do
	code --install-extension "${ext}"
done
