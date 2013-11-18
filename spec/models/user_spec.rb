require 'spec_helper'

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

end
