class User < ActiveRecord::Base
  def noisy?;
    false
  end

  def grosses_a;
    'A'
  end

  def kleines_a;
    'a'
  end

  def kleines_u;
    'u'
  end

  def kleines_r;
    'r'
  end
end