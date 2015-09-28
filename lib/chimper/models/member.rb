module Chimper
  class Member < BaseModel
    def initialize(data)
      @data = AwesomeStruct.new(decorate(data))
    end

    def bounced?
      status == 'cleaned'
    end

    private

    def decorate(data)
      if fields = data['merge_fields']
        first_name = fields['FNAME']
        last_name  = fields['LNAME']
      end
      decorated = {
        email:      data['email_address'],
        first_name: first_name,
        last_name:  last_name
      }
      data.merge(decorated)
    end
  end
end
