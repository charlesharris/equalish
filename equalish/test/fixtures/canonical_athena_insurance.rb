class CanonicalAthenaInsurance
  include ::Equalish::Models::Canonical

  #equalish_comparison_method ::Equalish::ComparisonMethods.Binary

  canonicalize :plan_id, 'Athena Health' do
    ['Athena Silver Pro', 'Some Other Athena Plan', 'Yet Another Athena Plan']
  end

#  canonicalize :plan_name, [:plan_designation] do
#    #::CanonicalData::Athena::PlanNames
#  end
#  canonicalize :member_id, [:member_num, :member_number] do |member_id|
#    #::CanonicalData::Athena::Normalizers::MemberId
#  end

end
