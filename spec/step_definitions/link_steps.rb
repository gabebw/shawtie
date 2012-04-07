step 'I create a link' do
  visit '/'
  fill_in 'URL', with: 'http://example.com'
  click_button 'Submit'
end

step 'I should see the shortened URL' do
  latest_link = Link.all.first(order: 'DESC')
  page.should have_content "#{page.current_host}/#{latest_link.hash}"
end
