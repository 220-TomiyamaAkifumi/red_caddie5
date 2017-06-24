Rails.application.config.generators do |g|
  # g.template_engine :erb
  g.orm :active_record
  g.assets false
  g.helper false
  g.template_engine :all
  g.fallbacks[:all] = :erb
  g.test_framework :rspec,
                   view_specs: false,
                   routing_specs: false,
                   helper_specs: false
end
