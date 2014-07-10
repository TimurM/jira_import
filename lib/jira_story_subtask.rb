require "csv"
puts "Jira_file initialized."

contents = CSV.open "MM_Jira_Story_with_subtask_id_7.9.csv", headers: true, header_converters: :symbol
    array_keys = []
    array_values = []

    contents.each do |row|
    key = row[:key]
    subtask = row[:subtask]
    
    each_row = {}
    
    if subtask != nil
    subtask = subtask.split(", ")
    subtask.each do |task|
        each_row[task] = key
        array_keys << each_row.keys
        array_values << each_row.values

    end
    end
    
    filename = "output_mm_jira.csv"
    
    File.open(filename,'w') do |file|
        
        file.puts array_keys
    end
    
end