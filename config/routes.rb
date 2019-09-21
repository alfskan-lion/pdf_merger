Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pdfs#new'
  
  resources :pdfs, only: [:index, :new, :create, :destroy]
  get 'pdfs/merge/:id', to: 'pdfs#merge', as: 'merge'
  get 'pdfs/download/:id', to: 'pdfs#download', as: 'download'
  get 'pdfs/download_pdf/:id', to: 'pdfs#download_pdf', as: 'download_pdf'
end
