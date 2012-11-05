# encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

tags = Tag.create([{name:"客厅"},
                   {name:"卧室"},
                   {name:"厨房"},
                   {name:"卫生间"},
                   {name:"餐厅"},
                   {name:"书房"},
                   {name:"儿童房"},
                   {name:"玄关"},
                   {name:"阳台"},
                   {name:"阁楼"}])

categories = Category.create([{name:"简约风格"},
                              {name:"田园风格"},
                              {name:"欧式风格"},
                              {name:"中式风格"},
                              {name:"美式风格"},
                              {name:"古典风格"},
                              {name:"日式风格"}])

