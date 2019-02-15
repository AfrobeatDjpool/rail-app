Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '360807547834333', 'a88dbbb849c9fd24bc5851f442514a11'
  provider :linkedin, '81q662zzjusm67', 'xZyEHlGAaZI8Gm9q'
  provider :google_oauth2, '244615150400-05thnta81fhg631up71t8v7e167i8pta.apps.googleusercontent.com', 'XW9LFZYGtLjruVh9kOpmCaRY'
  provider :twitter, 'BUE2EqG8smNV36Jh7Spvag', 'dIVz6CEvQvnMElzAjb2rt2bUPbhsproU24o22Vc'
end