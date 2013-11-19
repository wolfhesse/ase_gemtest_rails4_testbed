require 'spec_helper'

def noisy?
  false
end

FactoryGirl.define do

  sequence :user_login do |n|
    "12login-#{n}"
  end

  factory :user do
    name 'heinz with login ' + FactoryGirl.generate(:user_login)
  end


end


describe 'user stuff' do

  it 'should have name factored' do
    FactoryGirl.create(:user).name.should == 'heinz with login 12login-1'
  end

  it 'should generate 50 logins and check them ' do
    lastlogin='n/a'
    1.upto(50).each { lastlogin=FactoryGirl.generate(:user_login) }
    lastlogin.should == '12login-51'
  end

  it 'should create user empty' do
    User.new.should_not be nil?
  end

  it 'should have kleines a' do
    User.new.kleines_a == 'a'
  end

  it 'should have grosses a' do
    User.new.grosses_a.should eq 'A'
  end

  it 'should test when file gets saved' do
    Rails.logger.info 'testing user spec 23 '*5
  end


end

describe 'noise support' do
  specify 'user has noisy? call' do
    u=User.new
    # inq noise support level (_core_na, :spec_user_noise_support_ok, :spec_user_noise_support_level2, :spec_user_noise_asklevel_support)
    if u.respond_to? :noisy_inf
      Rails.logger.info u.noisy_inf
    else
      # support older version / core
      begin
        u.noisy?
        Rails.logger.info spec_user_noise_support: :ok
      rescue
        assert false
      end
    end
  end
end
describe 'reporting' do
  it 'should have a reporting-interface' do
    u=User.new
    u.if_reporting.should_not be nil?
  end

  specify 'able to write file ' do
    puts 'i write' if noisy?
    begin
      Rails.logger.info 'i write'
      Rails.logger.debug 'i debug'
      Rails.logger.error 'i err'
      Rails.logger.fatal 'fatal? not me.'
    end if noisy?

    u=User.new name: 'terminal23'
    expect(u.report_to('/tmp/user.json')).to eq :ack
    # and the file should exist
    File.exist?('/tmp/user.json').should eq true
    if  File.exist?('/tmp/user.json')
      # debug
      File.open('/tmp/user.json', 'r') { |f|
        Rails.logger.info 'terminal23'*5
        Rails.logger.info f.readlines
        f.close
      }
      expect(File.delete('/tmp/user.json')).to eq 1
    end
  end


end
