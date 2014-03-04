# encoding: utf-8
# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Testblog::Application.initialize!

# Time format
Time::DATE_FORMATS[:ru_datetime] = "%Y.%m.%d в %k:%M:%S"
