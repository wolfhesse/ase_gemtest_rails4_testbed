require 'noise_support'
class User < ActiveRecord::Base
  include NoiseSupport

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

  def if_reporting
    # code here
    1
  end

  def report_to(path)
    begin
      File.open(path,'w') {|f|
        f.write(self.inspect)
        f.close
      }
    rescue
      :nak
    end
    :ack
  end
end
