# tree.rb --- 
# Filename: tree.rb
# Description: Tree model
# Author: Noah Peart
# Created: Sun Dec  7 16:51:13 2014 (-0400)
# Last-Updated: Mon Dec 22 21:21:38 2014 (-0400)
#           By: Noah Peart
# 
class Tree < ActiveRecord::Base
  # attr_accessible :tree_id, :species, :dbh, :ht, :notes
  validates_uniqueness_of :tag, scope: :plot
  validates_presence_of :tag, :plot, :species
  has_many :comments, dependent: :destroy  # destroys all associated comments
  
  def self.get_all_plots
    self.select('DISTINCT plot').map(&:plot)
  end
  def self.get_all_species
    self.select('DISTINCT species').map(&:species)
  end
end
