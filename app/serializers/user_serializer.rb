class UserSerializer< ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :site_title, :site_subtitle, :email, :contact_email, :bio, :image, :user_projects, :user_links

  def image
    rails_blob_path(object.image, disposition: "attachment", only_path: true) if object.image.attached?
  end

  def user_projects 
    self.object.projects.map do |p|
      linkArray = p.project_links.map do |pl|
        {
          id: pl.id,
          link_text: pl.link_text,
          link_url: pl.link_url
        }
      end
      imageArray = p.project_images.map do |pi|
        image = rails_blob_path(pi.image, only_path: true)
        {
          image_caption: pi.image_caption,
          image: image,
          id: pi.id
        }
      end 
      {
        project_id: p.id,
        title: p.title,
        subtitle: p.subtitle,
        description: p.description,
        links: linkArray,
        images: imageArray
      }
    end
  end 

  def user_links 
    self.object.user_links.map do |ul|
      {
        id: ul.id,
        link_text: ul.link_text,
        link_url: ul.link_url
      }
    end 
  end

end
