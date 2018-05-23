document.addEventListener('turbolinks:load', function () {
    var ruleSelector = document.querySelector('select[name="badge[rule]"]');
    var levelSelector = document.querySelector('#level');
    if (ruleSelector) { ruleSelector.addEventListener('change', levelSelectorToggler) }
});

function levelSelectorToggler() {
    var ruleSelector = document.querySelector('select[name="badge[rule]"]');
    var levelSelector = document.querySelector('#level');
    if (ruleSelector.value == "by_level?") {
        levelSelector.classList.remove('hide');

    } else {
        levelSelector.classList.add('hide');
    }
}