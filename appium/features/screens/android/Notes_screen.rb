class NotesScreen
  def initialize
    @btn_new_note = 'New note'
    @input_note = '//android.widget.EditText'
    @btn_save = 'com.example.android.notepad:id/menu_save'
    @list_notes = '//android.widget.TextView'
  end

  def add_note
    find_element(:accessibility_id, @btn_new_note).click
  end

  def input_new_note(text)
    find_element(:xpath, @input_note).send_keys text
  end

  def save
    find_element(:id, @btn_save).click
  end

  def all_notes
    find_elements(:xpath, @list_notes)
  end
end
