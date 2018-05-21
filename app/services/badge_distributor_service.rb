class BadgeDistributorService

  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test_passages = TestPassage.where(@user == :user)
    @category = @test_passage.test.categories.first
    @level_current = @test_passage.test.level
    @badges_count = @user.badges.count.freeze

  end

  def assign_badges
    if all_in_category?
      @user.badges << Badge.where(rule: 'all_tests_in_category',
                                  category_id: @category.id).first
    elsif first_try?
      @user.badges << Badge.find_by_rule('on_first_try')
    elsif all_with_level?
      @user.badges << Badge.where(level: @level_current).first
    end

  end

  def first_try?
    user_tests_ids = @user.test_passages.pluck(:test_id)
    user_tests_ids.select { |id| id == @test_passage.test_id }.count <= 1
  end

  def all_in_category?
    all_tests = @category.tests.ids
    user_tests = @user.completed_tests.pluck(:id)
    check = all_tests & user_tests
    check.eql?(all_tests)
  end

  def all_with_level?
    all_tests_with_level = Test.where(level: @level_current).ids
    user_tests_ids = []
    t_passages = @user.completed_tests.select do |tp|
      tp.test.level == @level_current
    end
    t_passages.each {|t| user_tests_ids << t.test.id }
    check = all_tests_with_level & user_tests_ids.uniq!
    check.eql?(all_tests_with_level)
  end


  def badge_given?
    @badges_count < @user.badges.count
  end

end
