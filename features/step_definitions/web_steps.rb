require 'uri'
require 'cgi'
# require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

module WithinHelpers
  def with_scope(locator)
    locator ? within(locator) { yield } : yield
  end
end
World(WithinHelpers)

Given /^(?:|I )am on (.+)$/ do |page_name|
  visit root_path
end

Then /^(?:|I )should see "([^\"]*)"(?: within "([^\"]*)")?$/ do |text, selector|
  with_scope(selector) do
    if page.respond_to? :should
      page.should have_content(text)
    else
      assert page.has_content?(text)
    end
  end
end

When /^(?:|I )click "([^\"]*)"(?: within "([^\"]*)")?$/ do |element, selector|
  with_scope(selector) do
    find(element).click
  end
end

When /^(?:|I )follow "([^\"]*)"(?: within "([^\"]*)")?$/ do |link, selector|
  with_scope(selector) do
    click_link(link)
  end
end

When /^(?:|I )click any "([^\"]*)"(?: within "([^\"]*)")?$/ do |element, within|
  with_scope(within) do
    body_element = find(element)
    # walk-around coz capybara-webkit does not support hovering elements
    # and we cannot click on hidden one
    # page.evaluate_script("$(#{element}).show()")
    body_element.click
  end
end

Then /^I pause for a while$/ do
  sleep 3
end

Then /^show me the page$/ do
  save_and_open_page
end


Then /I should count exactly (\d+) "([^\"]+)"$/ do |count, selector|
  assert page.all(selector).count == count.to_i
end

Then /I should count more then (\d+) "([^\"]+)"$/ do |count, selector|
  assert page.all(selector).count > count.to_i
end

Then /check js/ do
  result = page.evaluate_script('4 + 4');
  assert 8 == result.to_i
end

Then /there should be "(\w+)" with class "(\w+)"/ do |class_holder, to_have_class|
  assert page.has_css?(".#{class_holder}.#{to_have_class}")
end