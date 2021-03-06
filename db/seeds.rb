

3.times do |topic|
  Topic.create!(title: "Topic #{topic + 1}")


end

10.times do |x|
  Blog.create!(
    title: "Blog post #{x}",
    body: "Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido usó una galería de textos y los mezcló de tal manera que logró hacer un libro de textos especimen. No sólo sobrevivió 500 años, sino que tambien ingresó como texto de relleno en documentos electrónicos, quedando esencialmente igual al original. Fue popularizado en los 60s con la creación de las hojas Letraset, las cuales contenian pasajes de Lorem Ipsum, y más recientemente con software de autoedición, como por ejemplo Aldus PageMaker, el cual incluye versiones de Lorem Ipsum.",
    topic_id: Topic.all.sample.id
    )
end

puts "Blog posts created"

5.times do |x|
  Skill.create!(
    title: "Rails #{x}",
    percent_utilized: 55
    )
end

puts "Skills created"


3.times do |x|
  Work.create!(
    title: "Portfolio #{x}",
    subtitle: "Ruby on Rails",
    body: "Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido usó una galería de textos y los mezcló de tal manera que logró hacer un libro de textos especimen. No sólo sobrevivió 500 años"
    )

end


puts "Portfolio work created"

t = %w(Ruby Angular Vue)

3.times do
  Work.first.technologies.create!(name: t.sample)
end

puts "Technologies created"


