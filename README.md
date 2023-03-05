# ios_new_MoviePreviewApp
---
## 프로젝트 목적
* URLSession을 사용한 기존 프로젝트를 Alamofire를 사용하여 다시 구현하였습니다.
원하는 영화를 검색하여 해당 영화의 간단한 설명과 프리뷰 영상을 볼 수 있습니다.
---
## 프로젝트 설명
* 사용기술


  <img src = "https://user-images.githubusercontent.com/82255206/221416181-33a9e911-05f4-424a-bbdb-f8530364e598.png" width="100" height="100"/>
  
* 개발환경


  <img src = "https://user-images.githubusercontent.com/82255206/221416207-0e80bf80-56a3-4911-99c2-9a04121bb8cb.png" width="100" height="100"/> 
 
* 기능설명  


  * 검색창에 영화제목을 검색할 수 있습니다.
  * 검색 목록을 선택하면 프리뷰 영상과 영화에 대한 간단한 설명을 확인할 수 있습니다.
  
 <img src = "https://user-images.githubusercontent.com/82255206/221648283-142d56a2-a456-4b7d-b71e-95f94969790d.png" width="170" height="360"/> <img src = "https://user-images.githubusercontent.com/82255206/221648251-61bcf2cc-2479-4a70-95ea-970f834bcc59.png" width="170" height="360"/> <img src = "https://user-images.githubusercontent.com/82255206/221648318-b67c15f8-e27f-4c97-9b3b-c55827be10e8.png" width="170" height="360"/>  

 * 프로젝트 구조  

<table>
<tbody>

<tr>
    <td><b>ViewController.swift</b></td>
<td> searchBar에 관련한 내용, 테이블 뷰 구성과 Alamofire를 이용하여 데이터를 받아오는 부분으로 이루어져 있습니다.</td>
</tr>

<tr>
    <td><b>Detail.swift</b></td>
<td>영화 목록을 선택하면 나오는 디테일 화면입니다. 뷰를 구성하는 컴포넌트의 아울렛 연결과 프리뷰 영상에 대한 내용으로 구성되어 있습니다.</td>
</tr>

<tr>
    <td><b>testCell.swift</b></td>
<td>cell을 구성하기 위한 컴포넌트 아울렛이 연결되어 있는 부분입니다.</td>
</tr>

<tr>
    <td><b>Detail.Storyboard</b></td>
<td>목록을 눌렀을 때 나오는 디테일 화면을 구성하는 storyboard 파일입니다.</td>
</tr>

<tr>
    <td><b>Main.Storyboard</b></td>
<td> 검색 목록 화면을 구성하는 storyboard 파일입니다.</td>
</tr>


</tbody>
</table>

* 실행방법  
```
1. Clone this repository.
2. Run Xcode and excute project.
```

