class BadgeDistributorService

  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test_passages = TestPassage.where(@user == :user)
    @category = @test_passage.test.categories.first
    @level_current = @test_passage.test.level
    @badges_count = @user.badges.count

  end

  def assign_badges
    Badge.all.select { |badge| send(badge.rule) }
  end

  def first_try?
    @user.tests.where(id: @test_passage.test_id).count <= 1
  end

  def all_tests_in_category?
    all_tests = @category.tests.ids.sort
    user_tests = @user.completed_tests.pluck(:id).sort
    check = all_tests & user_tests
    check == all_tests
  end

  def by_level?
    all_tests_with_level = Test.where(level: @level_current).ids
    user_tests_ids = []
    t_passages = @user.completed_tests.joins(:test).where(tests: { level: @level_current })
    t_passages.each {|t| user_tests_ids << t.test.id }
    check = all_tests_with_level & user_tests_ids.uniq!
    check == all_tests_with_level
  end

  def badge_given?
    @badges_count < @user.badges.count
  end

end
