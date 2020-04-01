import hashlib
import os
from typing import Tuple

def check_password_hash(password_hash: str, candidate_password: str, salt: bytes) -> bool:
    """Check that the password_hash is equivalent to the candidate_password hashed"""
    candidate_password = bytes(candidate_password, 'utf8')
    candidate_hash = hashlib.scrypt(candidate_password, salt=salt, n=16, r=8, p=1)
    return (candidate_hash == password_hash)

def generate_password_hash(password: str) -> Tuple[bytes, bytes]:
    """Hash the password, returning the hash and the salt"""
    password = bytes(password, 'utf8')
    salt = os.urandom(512)
    return hashlib.scrypt(password, salt=salt, n=16, r=8, p=1), salt
