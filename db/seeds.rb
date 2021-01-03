ProjectImage.destroy_all
ProjectLink.destroy_all
Project.destroy_all
UserLink.destroy_all
User.destroy_all 

ethan = User.create(
    email: "e@h.com",
    password_digest: BCrypt::Password.create('1234'),
    bio: "Ethan Green Hawke (born November 6, 1970) is an American actor, writer, and director. He has been nominated for four Academy Awards and a Tony Award. Hawke has directed three feature films, three off-Broadway plays, and a documentary. He has also written three novels and one graphic novel. He made his film debut with the 1985 science fiction feature Explorers, before making a breakthrough appearance in the 1989 drama Dead Poets Society. He appeared in various films before taking a role in the 1994 Generation X drama Reality Bites, for which he received critical praise. Hawke starred alongside Julie Delpy in Richard Linklater's Before trilogy: Before Sunrise (1995), Before Sunset (2004) and Before Midnight (2013), all of which received critical acclaim. ",
    contact_email: "ethan@hawke.com",
    site_title: "Ethan Hawke",
    site_subtitle: "I can finally pursue my dream of coding"
)

ethan.image.attach(
    io: File.open('./public/ethan.jpg'),
    filename: 'ethan.jpg',
    content_type: 'application/jpg'
)

ethan.user_links.create(
    link_text: "Github",
    link_url: "github.com"
)

hw = ethan.projects.create(
    title: "Hello World",
    subtitle: "My first coding project",
    description: "The phrase Hello World! has seen various deviations in punctuation and casing, such as the presence of the comma and exclamation mark, and the capitalization of the leading H and W. Some devices limit the format to specific variations, such as all-capitalized versions on systems that support only capital letters, while some esoteric programming languages may have to print a slightly modified string. For example, the first non-trivial Malbolge program printed HEllO WORld, this having been determined to be good enough. Other human languages have been used as the output; for example, a tutorial for the Go programming language outputted both English and Chinese characters, demonstrating the programming language's built-in Unicode support."
)

hw.project_links.create(
    link_url: "https://en.wikipedia.org/wiki/%22Hello,_World!%22_program",
    link_text: "Hello_World!"
)

hw_image_one = hw.project_images.create(
    image_caption: "here's a sample image"
)

hw_image_one.image.attach(
    io: File.open('./public/hw.jpg'),
    filename: 'hw.jpg',
    content_type: 'application/jpg'
)

