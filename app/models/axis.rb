class Axis < ActiveRecord::Base 
  belongs_to :fact
  belongs_to :dimension, :polymorphic => true
end
