require './lib/equalish.rb'
require 'test_helper'
require './test/fixtures/canonical_athena_insurance.rb'
require './test/fixtures/equivocal_athena_insurance.rb'

class EqualishTest < Minitest::Test

  def test_that_it_has_a_version_number
    refute_nil ::Equalish::VERSION
  end

  def test_equivocal_equals_canonical_if_all_defined_fields_match
    canonical_plan = CanonicalAthenaInsurance.new
    equivocal_plan = EquivocalAthenaInsurance.new(plan_id: 'Athena Silver Pro',
                                                  plan_name: 'some plan 2',
                                                  member_id: 54321)

    assert true if equivocal_plan == canonical_plan
  end

  def test_equivocal_does_not_equal_canonical_if_fields_do_not_match
    canonical_plan = CanonicalAthenaInsurance.new
    equivocal_plan = EquivocalAthenaInsurance.new(plan_id: 'sljfalfjlafjaljf',
                                                  plan_name: 'some plan 2',
                                                  member_id: 54321)

    assert true if equivocal_plan != canonical_plan
  end

end
