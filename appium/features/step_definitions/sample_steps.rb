Given 'I open demo app' do
  p 'im in given'
  sleep 2
end

# When 'I do something' do
#   p 'will do something here'
#   find_element(:accessibility_id, 'New note').click
#   # binding.pry
#   sleep 2
#   find_element(:xpath, '//android.widget.EditText').send_keys 'This is a new note, from Ruby'
#   Screenshot.capture_screenshot

#   find_element(:id, 'com.example.android.notepad:id/menu_save').click
#   # notes = find_elements(:tag_name, 'text')
#   sleep 2
#   notes = find_elements(:xpath, '//android.widget.TextView')
#   pp notes
#   p notes[0].text
#   p notes[1].text
#   expect(notes[1].text).to eq 'This is a new note, from Ruby'
# end

When 'I do something' do
  p 'will do something here'
  @app = NotesScreen.new
  @app.add_note
  # binding.pry
  sleep 2
  @app.input_new_note 'This is a new note, from Ruby'
  Screenshot.capture_screenshot

  @app.save
  # notes = find_elements(:tag_name, 'text')
  sleep 2
  notes = @app.all_notes
  pp notes
  p notes[0].text
  p notes[1].text
  expect(notes[1].text).to eq 'This is a new note, from Ruby'
end