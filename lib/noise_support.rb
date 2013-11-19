module NoiseSupport
  def noisy?;
    false
  end

  def noisy_inf
    # debugging
    if Rails.env == 'development'
      Rails.logger.debug(self.inspect)
    end
    # testing
    if Rails.env == 'test'
      Rails.logger.debug(self.inspect)
    end
    Rails.logger.debug(Rails.env.inspect)

    {spec_user_noise_support: :ok}
  end

end
