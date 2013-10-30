#
# Cookbook Name:: newrelic
# Resource:: deployment
#
# Copyright 2012-2013, Escape Studios
#

actions :notify
default_action :notify

attribute :url, :kind_of => String, :default => "https://rpm.newrelic.com/deployments.xml"
attribute :api_key, :name_attribute => true, :kind_of => String, :default => nil

attribute :application_name, :kind_of => String, :name_attribute => true, :default => nil #required when application_id is not set
attribute :application_id, :kind_of => Integer, :default => nil #required when app_name is not set
attribute :description, :kind_of => String, :default => nil #optional
attribute :revision, :kind_of => String, :default => nil #optional
attribute :changelog, :kind_of => String, :default => nil #optional
attribute :user, :kind_of => String, :default => nil #optional

def initialize(*args)
    super
    @action = :notify

    @run_context.include_recipe "curl"
end