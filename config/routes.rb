Rails.application.routes.draw do
  root to: "words#index"
  resources :words
  resources :word_templates
end
