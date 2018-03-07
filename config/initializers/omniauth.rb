Rails.application.config.middleware.use OmniAuth::Builder do
  provider :instagram, "e7f11531468b4306bf206108033c24b9", "b2b9bff7136140de8c01fb60cdb3c9bf", callback_path: '/users/auth/instagram/callback'
end

