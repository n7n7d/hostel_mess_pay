require 'test_helper'

class ResidentTest < ActiveSupport::TestCase

  def setup
    @hostel=hostels(:hostel1)
    @resident=@hostel.residents.build(room_number:"EF201",roll_number:"101303110",name:"Example Resident")
  end
  test "should be valid" do
    assert @resident.valid?
  end

  test "room_number should be present" do
    @resident.room_number = "     "
    assert_not @resident.valid?
  end
  test "roll_number should be present" do
    @resident.roll_number = "     "
    assert_not @resident.valid?
  end
  test "name should be present" do
    @resident.name = "     "
    assert_not @resident.valid?
  end

  test "name should not be too long" do
    @resident.name = "a" * 51
    assert_not @resident.valid?
  end

  test "roll_number should be unique" do
    duplicate_user = @resident.dup
    duplicate_user.roll_number=@resident.roll_number.upcase
    @resident.save
    assert_not duplicate_user.valid?
  end

end
