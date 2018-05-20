document.addEventListener('turbolinks:load', function () {
    var ruleSelector = document.querySelector('select[name="badge[rule]"]');
    var categorySelector = document.querySelector('select[name="badge[category_id]"]');
    if (ruleSelector) { ruleSelector.addEventListener('change', categorySelectorToggler) }
});

function categorySelectorToggler() {
     var ruleSelector = document.querySelector('select[name="badge[rule]"]');
     var categorySelector = document.querySelector('select[name="badge[category_id]"]');
    if (ruleSelector.value == "all_tests_in_category") {
        categorySelector.classList.remove('hide')

    } else {
        categorySelector.classList.add('hide')
    }
}