# coding: utf-8
class Movie < ActiveRecord::Base
  attr_accessible :id, :title, :description, :category_id, :image_url, :image_num, :org_id, :thumbnail_url, :released_at
  
  has_many :reviews
  #
  #== key �ǥ����Ȥ����ǲ������ֵѤ���
  #
  def self.get_all_data(key)
    # �����ȥ������������ʤ�����id�ǥ�����
    unless self._is_correct_key(key)
      key = "id"
    end

    order = "DESC"
    # �����ȥ�ξ��Τ߾���
    if key == "title" 
      order = "ASC"
    end

    movies = self.find(:all,
                       :order => [key+" "+order],
                      )
    return movies 
  end

  #
  #== �����ȥ����ΥХ�ǡ�������Ԥ�
  #
  def self._is_correct_key(key)
    # �����̾����������Ǽ���
    columns = self.column_names
    return columns.include?(key)
  end

end
