class BadgeDistributorService

  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test_passages = TestPassage.where(:user == @user)
    @category  = @test_passage.test.categories.first
  end


  def assign_badges
    if all_in_category?
      badge = Badge.find_by_rule("all_tests_in_category")
      @user.badges << badge
    end
  end


  def all_in_category?
    all_tests = @category.tests.ids
    user_tests = @user.completed_tests.pluck(:id)
    check = all_tests & user_tests
    check.eql?(all_tests)
  end

end