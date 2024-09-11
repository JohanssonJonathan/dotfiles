myfunction() {
 npm install --userconfig=/Users/jonathanjohansson/publicNPM "$1"
}


PS1="%F{red}%n@%m %1~ %# "
alias zshrc="nvim ~/.zshrc"
alias dnvim="cd ~/.config/nvim" 
alias vfactive="cd && cd Webb/Volvo/vce-frontend-fleet-activecare/"
alias vsactive="cd && cd Webb/Volvo/vce-service-fleet-activecare/"
alias vfuikit="cd && cd Webb/Volvo/vce-frontend-uikit/"
alias vfcaretrack="cd && cd Webb/Volvo/vce-frontend-fleet-caretrack"
alias vfcommonui="cd && cd Webb/Volvo/vce-package-fleet-common-ui"
alias vfinsights="cd && cd Webb/Volvo/vce-frontend-fleet-insights" 

#npm commands
#########

alias rserve="npm run start"
alias rstart="npm run serve"
alias add.="git add ."
alias status="git status"

#git commands
#########

alias pull="git pull"

checkoutnew() {
  git checkout -b $1
}


checkout() {
  git checkout $1
}

commit() {
  git commit -m "$1"
}


alias 20="nvm use v20"
###source <(npx @volvo/vce-service-util completion-script)
