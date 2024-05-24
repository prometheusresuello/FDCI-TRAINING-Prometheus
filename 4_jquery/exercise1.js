
const books = [
  { 
    title: "The Great Gatsby", 
    author: "F. Scott Fitzgerald", 
    pages: 180, 
    year: 1925, 
    isbn: "9780743273565" 
  },
  { 
    title: "To Kill a Mockingbird", 
    author: "Harper Lee", 
    pages: 281, 
    year: 1960, 
    isbn: "9780061120084" 
  },
  { 
    title: "1984", 
    author: "George Orwell", 
    pages: 328, 
    year: 1949, 
    isbn: "9780451524935" 
  }
];

// Write a function here
function getInventory() {
//   code here...

let count = books[0].pages + books[1].pages + books[2].pages;
let allAuthors = books[0].author + ", " +books[1].author +", "+books[2].author;
let oldestBook1 = books.reduce((oldest, current) =>{ return oldest.year < current.year ? oldest : current;
});
let newestBook1 = books.reduce((newest, current) => { return newest.year > current.year ? newest : current;
    
});

let all =[
       {totalBooks: books.length},
        {totalPages: count},
        {authors: allAuthors},
        {oldesetBook: oldestBook1},
        {newestBook: newestBook1}
,];
return all;

  
}

console.log(getInventory(books));