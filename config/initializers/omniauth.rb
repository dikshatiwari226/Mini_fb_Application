Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '584175165442247', '0dbe06c52291a17b450eb7ccd7fd2373'
  provider :google_oauth2, '876763969714-472l2plqatl100fib49lg3ua819t0vo2.apps.googleusercontent.com', 'QT9W5o7Yiqum9rskbjAtq0yi'
  provider :linkedin, '81fxh5u7kk5b0q', 'rePvkhuFlMoH2zmI'
 	provider :twitter, 'y6kILe3VwuGpaFIIfPXdnv8pw', 'Gb76xJS6ZvTrzzxp0jNFLnZG2nNhNaaNPfx5FAWLrL5y11e14D' 
end