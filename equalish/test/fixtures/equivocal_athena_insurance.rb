class EquivocalAthenaInsurance
  attr_accessor :plan_id, :plan_name, :member_id, :extra_data

  def initialize(plan_id:, plan_name:, member_id:, extra_data: {})
    @plan_id = plan_id
    @plan_name = plan_name
    @member_id = member_id
    @extra_data = extra_data
  end
end
