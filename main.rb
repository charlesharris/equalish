require 'pry'
require './equalish/lib/equalish/models/equivocal.rb'
require './equalish/lib/equalish/models/canonical.rb'

class CanonicalAthenaInsurance
  include ::Equalish::Models::Canonical

  #equalish_comparison_method ::Equalish::ComparisonMethods.Binary

  attr_accessor :plan_id, :plan_name, :member_id, :extra_data

  canonicalize :plan_id, [:plan_number, :plan_num] do
    ['Athena Silver Pro', 'Athena Health', 'Some Other Athena Plan']
  end

#  canonicalize :plan_name, [:plan_designation] do
#    #::CanonicalData::Athena::PlanName
#  end
#  canonicalize :member_id, [:member_num, :member_number] do |member_id|
#    #::CanonicalData::Athena::Normalizers::MemberId
#  end

  #canonicalize_optional :extra_data
end


class OopsLtdInsuranceData
  include ::Equalish::Models::Equivocal

  canonical_model CanonicalAthenaInsurance

  attr_accessor :plan_id, :plan_name, :member_num, :extra_data

  def initialize(plan_id:, plan_name:, member_num:, extra_data:)
    @plan_id = plan_id
    @plan_name = plan_name
    @member_num = member_num
    @extra_data = extra_data
  end
end


class StitchCoInsuranceData
  include ::Equalish::Models::Equivocal

  canonical_model CanonicalAthenaInsurance

  attr_accessor :plan_number, :plan_name, :member_number

  def initialize(plan_number:, plan_name:, member_number:)
    @plan_number = plan_number
    @plan_name = plan_name
    @member_number = member_number
  end
end


class BandageCoverageInsuranceData
  include ::Equalish::Models::Equivocal

  canonical_model CanonicalAthenaInsurance

  attr_accessor :plan_num, :plan_name, :member_info

  def initialize(plan_num:, plan_name:, member_info:)
    @plan_num = plan_num
    @plan_name = plan_name
    @member_info = member_info
  end
end

oops_plan = OopsLtdInsuranceData.new(plan_id: 123, plan_name: 'Athena Silver Pro', member_num: 1234, extra_data: nil)
stitchco_plan = StitchCoInsuranceData.new(plan_number: 123, plan_name: 'Athena Health', member_number: 1234)
bandage_coverage_plan = BandageCoverageInsuranceData.new(plan_num: 123, plan_name: 'Some Other Athena Plan', member_info: 1234)

if oops_plan == CanonicalAthenaInsurance.new
  puts 'EQUAL!'
end



