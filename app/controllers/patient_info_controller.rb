require 'json'

class PatientInfoController < ApplicationController
  def index
    file = File.read('patient[3]-fixed.json')
    info = JSON.parse(file)

    # Combine name based on given and family name
    @name = ""
    info["name"][0]["given"].each {|name| @name += name.capitalize + " "}
    info["name"][0]["family"].each {|name| @name += name.capitalize + " "}
    @name.strip!

    # Organization display name
    @organization = info["managingOrganization"]["display"].titleize

    @gender = info["gender"].capitalize

    # conditions and length
    @num_of_condtions = info["conditions"].length
    @conditions = info["conditions"]
  end
end
