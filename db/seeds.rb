# encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

tags = Tag.create([{title:"客厅"},
                   {title:"卧室"},
                   {title:"厨房"},
                   {title:"卫生间"},
                   {title:"餐厅"},
                   {title:"书房"},
                   {title:"儿童房"},
                   {title:"玄关"},
                   {title:"阳台"},
                   {title:"阁楼"}])

categories = Category.create([{title:"简约风格"},
                              {title:"田园风格"},
                              {title:"欧式风格"},
                              {title:"中式风格"},
                              {title:"美式风格"},
                              {title:"古典风格"},
                              {title:"日式风格"}])

