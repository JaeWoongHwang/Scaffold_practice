# Post 게시판 만들기

## 0. routes.rb
- /posts/index
- /posts/new
- /posts/create
- /posts/show:id
- /posts/edit:id
- /posts/update:id
- /posts/destroy:id

## 1. Post Controller
- index : 모든 포스트를 보여준다.(제목만 보여주고 링크를 통해 들어가면 show page로 간다.)
- new : 새로운 글을 입력 받는다.(create로 보내준다.)
- create : 새로운 글을 DB에 저장한다.
- show :  글 한개를 보여준다.
- edit : 수정된 글을 입력 받는다 (update로 보내준다.)
- update : 글을 수정하여 DB에 반영한다.
- destroy : 글을 지운다.

## 2. Post Model
- title :string
- content : text
