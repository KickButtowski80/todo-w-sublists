########################################
########################################
##    _____            _              ##
##   | ___ \          | |             ##
##   | |_/ /___  _   _| |_ ___  ___   ##
##   |    // _ \| | | | __/ _ \/ __|  ##
##   | |\ \ (_) | |_| | ||  __/\__ \  ##
##   \_| \_\___/ \__,_|\__\___||___/  ##
##                                    ##
########################################
########################################

Rails.application.routes.draw do

  # => Root
  root to: "application#index"

  # => Resources
  resources :lists, controller: :application, path: "", except: :show do # => url.com/:list_id
    resources :items, controller: :application do # => url.com/:list_id/item/:id
      patch :complete, on: :member # => member required to make param :id
    end
  end

end

########################################
########################################
