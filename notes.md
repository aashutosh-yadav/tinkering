# Backend & Networking Fundamentals Notes

---

## 1. Core Internet Concepts

### Server

A **server** is a computer/program that provides data or services to other computers.
Example: A FastAPI app running on port 8000 waiting for requests.

### Client

A **client** is the requester of services from a server.
Examples:

* Browser
* Mobile app
* curl
* Postman
* Swagger UI

### IP Address

An **IP address** is the unique identity of a device on a network.
Example:
127.0.0.1 → localhost (your own computer)

### DNS (Domain Name System)

DNS converts human-readable names into IP addresses.

```
google.com → 142.250.xxx.xxx
```

### Port

A **port** is a door on a machine used by a program.

```
IP identifies machine
Port identifies application

127.0.0.1:8000 → FastAPI app
```

---

## 2. HTTP & Networking

### HTTP

HyperText Transfer Protocol

* Stateless
* Request → Response
* Used for APIs & websites

### HTTPS

HTTP + Encryption (TLS/SSL)
Protects:

* Passwords
* Tokens
* Personal data

---

## 3. TCP vs UDP

### TCP (Transmission Control Protocol)

* Reliable
* Ordered
* Retransmits lost packets
* Used by HTTP
* Used by backend systems

### UDP

* Faster
* No guarantee delivery
* Used in gaming & streaming

---

## 4. Important Backend Mindset

Backend is NOT just writing APIs.

Backend IS understanding:

* Networking
* Protocols
* Architecture
* Data flow
* Security

---

## 5. HTTP Request Data Locations

### 1) Path Parameter

```
/users/5
```

### 2) Query Parameter

```
/users?id=5
```

### 3) Request Body (JSON)

POST request

---

## 6. Swagger & curl

Swagger Docs:

```
http://127.0.0.1:8000/docs
```

curl POST example:

```
curl -X POST "http://127.0.0.1:8000/data" \
 -H "Content-Type: application/json" \
 -d '{"name":"Sir","age":20}'
```

---

## 7. ORM (Object Relational Mapper)

Example: SQLAlchemy

Flow:

```
ORM Object
   ↓
Session
   ↓
Engine
   ↓
Connection Pool
   ↓
PostgreSQL
```

### Components

**Engine**

* Holds DB connection config
* Manages pool

**Session**

* Tracks objects
* Performs transactions

**Connection Pool**

* Reuses DB connections
* Improves performance

---

## 8. Database Request Flow

```
HTTP Request
     ↓
FastAPI
     ↓
Pydantic Validation
     ↓
Session
     ↓
Engine
     ↓
Connection Pool
     ↓
PostgreSQL
     ↓
Disk
```

---

## 9. Request Lifecycle Example (/signup)

1. Client sends JSON
2. FastAPI receives request
3. Pydantic validates
4. Session created
5. ORM object created
6. Added to session
7. Commit → SQL generated
8. PostgreSQL writes to disk
9. Refresh returns ID
10. Session closes

---

## 10. Read vs Write Operations

**Read (SELECT)**

* No commit needed

**Write (INSERT/UPDATE/DELETE)**

* Commit required

---

## 11. Stateful vs Stateless HTTP

HTTP is stateless but we simulate state using:

* Cookies
* Server sessions
* JWT tokens

Flow:

1. User logs in
2. Server returns session/JWT
3. Client sends it every request
4. Server verifies identity

---

## 12. Reverse Proxy

A reverse proxy sits before your backend server.

Responsibilities:

* Security
* Load balancing
* SSL termination
* Routing traffic

Examples: Nginx, Traefik

---

## 13. ASGI Server

ASGI servers run Python async apps.

Examples:

* Uvicorn
* Hypercorn

They:

* Handle connections
* Talk HTTP protocol
* Run FastAPI app

---

## 14. Important Backend Concepts

* ORM
* Database sessions
* Dependency Injection
* Hashing passwords
* Persistent storage
* Table models
* Schema separation

---

## 15. Absolute vs Relative Imports

### Absolute Import

```
from app.database import models
```

Clear & recommended

### Relative Import

```
from .database import models
```

Used inside packages

---

## 16. PostgreSQL Learning Path

### Step 1 — SQL Fundamentals

* SELECT
* INSERT
* UPDATE
* DELETE
* WHERE
* ORDER BY
* LIMIT
* GROUP BY
* JOIN
* Constraints
* Primary/Foreign Keys

### Step 2 — PostgreSQL Concepts

* Data types
* Indexing
* Transactions
* ACID
* Locks
* Query planning (EXPLAIN)
* Performance tuning

### Step 3 — Advanced

* JSONB
* Normalization
* Optimization

---

## 17. Database Architecture Summary

Write flow:

```
Request → Validation → Session → ORM → Engine → PostgreSQL → Disk
```

Read flow:

```
Request → Validation → Session → ORM → Engine → PostgreSQL → Response
```

---

## 18. Why Databases Don’t Break With Multiple Users

Handled by:

* Transactions
* Locks
* WAL (Write Ahead Log)
* Primary Keys
* Isolation levels

Prevents:

* Duplicate IDs
* Corruption
* Partial writes

---

## Final Mindset

You are not building endpoints.
You are building a distributed data system.
