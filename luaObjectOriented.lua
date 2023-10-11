--面向对象思想
--构建一个万物之父 所有对象的基类 Object
--封装
Object={}
--实例化方法
function Object:new()
	local obj = {}
	--给空对象设置元表，以及_index
	self.__index=self
	setmetatable(obj,self)
	return obj
end

--继承
function Object:subClass(className)
	--根据名称生成一张表 相当于一个类
	_G[className]={}
	local obj=_G[className]
	--设置自己的父类
	obj.base=self
	--给子类设置元表，以及_index
	self.__index=self
	setmetatable(obj,self)
end

--申明一个新的类
Object:subClass("GameObject")
--成员变量
GameObject.posx=0
GameObject.posY=0
--成员方法
function GameObject:Move()
	self.posx=self.posx+1
	self.posY=self.posY+1
end

--实例化对象使用
local obj=GameObject:new()
print(obj.posx)
obj:Move()
print(obj.posx)

--申明一个新的类 player继承GameObject
GameObject:subClass("Player")
--多态 重写了GameObject中的move方法
function Player:Move()
	--base调用父类中的方法 用.自己传第一个参数
	self.base.Move(self)
end
--实例化Player对象
print("************")
local P1=Player:new()
print(P1.posx)
P1:Move()
print(P1.posx)