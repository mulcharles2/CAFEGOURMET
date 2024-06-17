// Carregar dados do localStorage ou inicializar arrays vazios
let cart = JSON.parse(localStorage.getItem('cart')) || [];
let users = JSON.parse(localStorage.getItem('users')) || [];

// Função para adicionar produto ao carrinho
function addToCart(productName, productPrice) {
    const product = { name: productName, price: productPrice };
    cart.push(product);
    localStorage.setItem('cart', JSON.stringify(cart));
    alert(`${productName} foi adicionado ao carrinho!`);
}

// Função para exibir itens do carrinho
function displayCart() {
    const cartItemsContainer = document.querySelector('.cart-items');
    const totalPriceElement = document.getElementById('total-price');
    cartItemsContainer.innerHTML = '';
    let totalPrice = 0;

    cart.forEach(product => {
        const item = document.createElement('div');
        item.classList.add('cart-item');
        item.innerHTML = `
            <h2>${product.name}</h2>
            <p>Preço: R$${product.price.toFixed(2)}</p>
        `;
        cartItemsContainer.appendChild(item);
        totalPrice += product.price;
    });

    totalPriceElement.textContent = totalPrice.toFixed(2);
}

// Função para cadastrar um novo usuário
function signup(event) {
    event.preventDefault();
    const name = document.getElementById('signup-name').value;
    const email = document.getElementById('signup-email').value;
    const password = document.getElementById('signup-password').value;

    // Verifica se o email já está cadastrado
    const existingUser = users.find(user => user.email === email);
    if (existingUser) {
        alert('Este email já está cadastrado. Por favor, use outro.');
        return;
    }

    const user = { name, email, password };
    users.push(user);
    localStorage.setItem('users', JSON.stringify(users));
    alert('Usuário cadastrado com sucesso!');
    document.getElementById('signup-form').reset();
}

// Função para login
function login(event) {
    event.preventDefault();
    const email = document.getElementById('login-email').value;
    const password = document.getElementById('login-password').value;

    const user = users.find(user => user.email === email && user.password === password);
    if (user) {
        alert('Login bem-sucedido!');
        window.location.href = 'index.html';
    } else {
        alert('Email ou senha incorretos.');
    }
}

// Função para finalizar compra
function checkout(event) {
    event.preventDefault();
    if (cart.length === 0) {
        alert('Seu carrinho está vazio. Adicione produtos antes de finalizar a compra.');
        return;
    }

    alert('Compra finalizada com sucesso!');
    cart = [];
    localStorage.setItem('cart', JSON.stringify(cart));
    window.location.href = 'index.html';
}

// Adicionar listeners aos formulários
document.addEventListener('DOMContentLoaded', function() {
    if (document.getElementById('signup-form')) {
        document.getElementById('signup-form').addEventListener('submit', signup);
    }

    if (document.getElementById('login-form')) {
        document.getElementById('login-form').addEventListener('submit', login);
    }

    if (document.getElementById('checkout-form')) {
        document.getElementById('checkout-form').addEventListener('submit', checkout);
    }
});
